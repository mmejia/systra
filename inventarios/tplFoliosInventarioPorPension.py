tplFoliosInventarioPorPension="""{
	
	"Enero":[
	{% for item in mes.Enero%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Febrero":[
	{% for item in mes.Febrero%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Marzo":[
		{% for item in mes.Marzo%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}",
		}
	{%endfor%}
	],
	 
	
	"Abril":[
	{% for item in mes.Abril%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Mayo":[
		{% for item in mes.Mayo%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Junio":[
	{% for item in mes.Junio%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Julio":[
	{% for item in mes.Julio%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Agosto":[
	{% for item in mes.Agosto%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Septiembre":[
	{% for item in mes.Septiembre%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Octubre":[
	{% for item in mes.Octubre%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Noviembre":[
	{% for item in mes.Noviembre%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	],
	 
	
	"Diciembre":[
	{% for item in mes.Diciembre%}
		{% if forloop.counter0 > 0  %},{% endif %}
		{
		 "nombre_recibido":"{{item.nombre_recibido}}",
		 "folio_inicial":"{{item.folio_inicial}}",
		 "folio_final":"{{item.folio_final}}",
		 "fecha_recibido":"{{item.fecha_recibido}}"
		}
	{%endfor%}
	]
}
"""