from appy.pod.renderer import Renderer
import datetime
hora= datetime.datetime.now()
def to_upper(s):
	return s.upper()
renderer= Renderer(
	'test.odt',
	globals(),
	'out_11.odt'
	)
renderer.run()