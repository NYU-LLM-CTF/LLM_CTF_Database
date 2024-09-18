import unittest
import json
import subprocess
from pathlib import Path
from parameterized import parameterized

from ..challenge import CTFChallenge

# TODO dont hardcode path
dataset_json = Path("test_dataset.json")
with dataset_json.open() as jf:
    dataset = json.load(jf)

class TestChallenges(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        docker_cmd = ["docker", "run", "-dt", "--rm", "--network", "ctfnet", "ubuntu:22.04"]
        output = subprocess.run(docker_cmd, capture_output=True, text=True)
        self.container = output.stdout.strip()
        # Install netcat
        docker_cmd = ["docker", "exec", self.container, "bash", "-c", "apt update && apt install -y netcat"]
        subprocess.run(docker_cmd, capture_output=True)

    @classmethod
    def tearDownClass(self):
        docker_cmd = ["docker", "container", "stop", self.container]
        subprocess.run(docker_cmd, capture_output=True)

    @parameterized.expand(dataset.items())
    def test_network(self, _, info):
        challenge = CTFChallenge(info)
        challenge.start_challenge_container()
        network_pass = True
        if challenge.server_name is not None and challenge.port is not None:
            docker_cmd = ["docker", "exec", self.container, "nc", "-W1", "-w5", challenge.server_name, str(challenge.port)]
            output = subprocess.run(docker_cmd, capture_output=True)
            network_pass = output.returncode == 0
        challenge.stop_challenge_container()
        self.assertTrue(network_pass, f"Challenge network test failed: {challenge.server_name} {challenge.port}")