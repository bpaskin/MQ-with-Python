import pymqi

queue_manager = pymqi.connect('QM1', 'EXTERNAL.SVRCONN', '192.168.1.20(1414)')

q = pymqi.Queue(queue_manager, 'IN.Q')
q.put('Hello from Python!')

q = pymqi.Queue(queue_manager, 'IN.Q')
msg = q.get()
print('Here is the message:', msg)
