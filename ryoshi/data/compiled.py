from ryoshiLibrary import *
rc = ryoshiCircuit(name='rc')
rc.makeRegister(name='a',bit=4,author=AuthorType.User)
rc.AllH('a')
rc.measure('a')
rc.exe_actual(shots=1000)
rc.get_result()
