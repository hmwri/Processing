from ryoshiLibrary import *
rc = ryoshiCircuit(name='rc')
rc.makeRegister(name='a',bit=3,author=AuthorType.User)
rc.Entangle2('a',2,5)
rc.makeRegister(name='0',bit=2,author=AuthorType.Compiler)
rc.write('0',2)
rc.minusEqual('a','0')
rc.measure('a')
rc.exe_sim(shots=1000)
rc.get_result()
