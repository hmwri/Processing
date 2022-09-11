from ryoshiLibrary import *
rc = ryoshiCircuit(name='rc')
rc.makeRegister(name='random',bit=4,author=AuthorType.User)
rc.AllH('random')
rc.measure('random')
rc.exe_sim(shots=1)
rc.get_result()
