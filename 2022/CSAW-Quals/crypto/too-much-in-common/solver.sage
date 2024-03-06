from Crypto.Util.number import (
    long_to_bytes
)
import sympy as sp


# TODOs
# need to test automating solver; right now we manually interact with challenge

# server = remote("crypto.chal.csaw.io",5008)
# server = remote("localhost", 5000)

# Mathematical Reasoning: https://infosecwriteups.com/rsa-attacks-common-modulus-7bdb34f331a5
def common_attack():
    # Grab N, E1, C1, E2, C2 from interacting with server
    # you'll notice you need to ask server a few times to get matching N
    N = 95816814369174203049134462211015209833940408856889030989163166605890560806302524303641507551677967698849119476605612484967929649745566176844087701354432010822315819024185068386835459923529341926564276018233779815697859648420289089330625342907269445588207181169767538014339951622271132896175054278624866612443
    e1 = 32464274385801623905280752907337310129165355079924963284678822221898334306707
    c1 = 60862285734881708991669218336108913039927232370622128899663747769132189536380418096462544978763240713962580567286430544536279110641850477570607220815050111202801501137556112946161765598426529863997304146670837481754086953245579359637758377679049553572667182292662439970810800707339302447092352475091866390668
    e2 = 6561396376988149361780669628684057182813775428728229435931513584817400663999
    c2 = 62847201449945068154130518758312883419475506938534722608317105867594432370310255374502383245453097076090900167935105297604054709582010126756106697568109217738091880088288129297282831981164756422880622056110863997796523756736270835413657811351976272913444641787797720321441328020004417904125727719573703831087

    # works only if gcd(e1,e2) == 1
    g, a, b = xgcd(e1, e2)

    if a < 0:
        temp = pow(c1, -1)
        m1 = power_mod(temp, -a, N)
    else:
        m1 = power_mod(c1, a, N)
    if b < 0:
        temp = pow(c2, -1)
        m2 = power_mod(temp, -b, N)
    else:
        m2 = power_mod(c2, b, N)

    res = mod(m1 * m2, N)
    print(res)
    print(long_to_bytes(res))


# Mathematical Reasoning: https://math.stackexchange.com/questions/3082920/how-can-i-break-rsa-if-i-know-the-private-key
# condition: e < sqrt(N)

def get_phi():
    # Grab N, e, d from interacting with server
    N = 78992051986551098430308148786935150838411335192372205920943802473168885680763189303049487130047478593128786208662571633564811353868495771382888928426002587503001499230797600463840335174304714034918571003137169923618965003284064188925765001272431243250900629067053162571144909951158779059789001351584002158457
    e = 1836943120336657857815426424606273611610952290677337946637994266198310482657
    d = 7565572871643122284965528638186936813740989307751816409353445269097027205790224277113411968620776940961165604171366759072324212475024800187959881612650534200370778693920769288658694135242906620021119238632628723838974704582998007703110137561197863856040985931370642315749318203092627590378954523488616512993

    k = ceil(e*d/N)
    paq = (k*N - e*d +k +1 )/k
    pmq = sqrt(pow(paq,2) - 4*N)

    p, q = sp.symbols('p, q')
    eq1 = p + q
    eq2 = p - q
    phi_var = sp.solve([eq1 - paq, eq2 - pmq], (p, q))
    print((phi_var[p] -1) * (phi_var[q]-1))



common_attack()
get_phi()
