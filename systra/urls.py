#-*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
#from django.views.generic.simple import direct_to_template
from django.shortcuts import render
from ViewMain import signin
from ViewMain import getProfile
from ViewMain import main
from ViewMain import validate_login
from accidentes.views import inicia_accidente
from accidentes.views import captura_accidente
from accidentes.views import captura_accidente_para_seleccionar_preliminar
from accidentes.views import cargarAccidente_accidente
from accidentes.views import create_accidente
from accidentes.AccidenteListView import AccidenteListView
from accidentes.views import listAccidentes_accidente
from accidentes.views import getAccidente_accidente
from accidentes.views import listar_Activos
from accidentes.views import viewAccidente

from accidentes.views import addPreliminar_accidente
from accidentes.AccCabinaListView import AccCabinaListView

from accidentes.AccCabinaSoloListView import AccCabinaSoloListView
from accidentes.views import soloCapturarPreliminar

from accidentes.views import listar_preliminar_accidente
from accidentes.views import getPreliminar_accidente
from accidentes.views import cargarPreliminar_accidente
from accidentes.views import crearPreliminar_accidente


from accidentes.views import mapa_busqueda_accidente
from accidentes.views import listPuntosAccidentes
from accidentes.views import getUrlImagenesDeAccidente
from accidentes.views import listar_folios_accidente
from accidentes.views import reporte_accidente
from accidentes.views import cancelar_preliminar
from accidentes.views import ventana_reporte
from accidentes.views import ventana_reporte_from_id
from accidentes.views import ventana_reporte_posterior
from accidentes.views import ventana_reporte_posterior_from_id


from infracciones.views import captura_infraccion
from infracciones.views import crearInfraccion_infraccion
from infracciones.views import updateInfraccion_infraccion
from infracciones.InfraccionListView import InfraccionListView
from infracciones.views import listInfracciones_infraccion
from infracciones.ExcelInfraccionListView import  ExcelInfraccionListView
from infracciones.PdfInfraccionListView import PdfInfraccionListView
from infracciones.views import get_infraccion
from infracciones.views import viewInfraccion
from infracciones.views import cargarInfraccion_infraccion
from infracciones.views import ventana_reporte_infraccion
from infracciones.views import ventana_reporte_infraccion_from_id
from infracciones.views import solo_captura_infraccion
from infracciones.views import removeInfraccion
from infracciones.views import getHistInfractor
from infracciones.views import getHistVehiculo

from infracciones.view_folio import  list_folios
from infracciones.view_folio import  add_folio
from infracciones.view_folio import  get_blocks_by_folio
from infracciones.view_folio import  remove_folio
from infracciones.view_folio import  folios_disponibles
from infracciones.view_folio import  folios_capturados
from infracciones.view_folio import  view_elem_folios
from infracciones.view_folio import  json_elem_folios
from infracciones.view_folio import  profile_historial_folios
from infracciones.view_folio import  get_detail_from_folio
from infracciones.view_folio import  remove_block
from infracciones.view_folio import  list_comandancia

from inventarios.views import captura_inventario
from inventarios.views import liberar_inventario
from inventarios.views import crear_inventario
from inventarios.views import remove_inventario
from inventarios.views import update_inventario
from inventarios.views import crear_liberar
from inventarios.views import get_inventario
from inventarios.InventarioVehiculoListView import  InventarioVehiculoListView
#from inventarios.views import  excel_view
from inventarios.ExcelInventarioVehiculoListView import  ExcelInventarioVehiculoListView
from inventarios.views import listInventarios_inventario
from inventarios.views import cargarInventario_inventario
from inventarios.views import libera_reporte
from inventarios.views import libera_reporte_from_id
from inventarios.views import viewInventario
from inventarios.views import liberar_seleccionando
from inventarios.views import get_inventario_con_otros
from inventarios.views import solo_captura_inventario


from inventarios.view_folio import inventarios_admin_folio
from inventarios.view_folio import inventarios_foliosaniobypension




from content.views import content_content
from content.views import upload_fotografia
from content.views import upload_croquis

# importaciones para los catalogos json
from accidentes.CatalogosUtilView import listDelegaciones
from accidentes.CatalogosUtilView import listComandancias
from accidentes.CatalogosUtilView import listTurnos;
from accidentes.CatalogosUtilView import listClasAccidente
from accidentes.CatalogosUtilView import listAccTipoAccidente
from accidentes.CatalogosUtilView import listCalles
from accidentes.CatalogosUtilView import listColonias
from accidentes.CatalogosUtilView import listMunicipios
from accidentes.CatalogosUtilView import listEstados
from accidentes.CatalogosUtilView import listMarcas
from accidentes.CatalogosUtilView import listTipoVehiculo
from accidentes.CatalogosUtilView import listPensiones
from accidentes.CatalogosUtilView import listColores
from accidentes.CatalogosUtilView import listProfile

from accidentes.CatalogosUtilView import listAccEdoConductor
from accidentes.CatalogosUtilView import listAccEdoFisico
from accidentes.CatalogosUtilView import listTbDetenido
from accidentes.CatalogosUtilView import listTbLevantadopor
from accidentes.CatalogosUtilView import listTbTrasladadoa
from accidentes.CatalogosUtilView import listTbTipoLicencia
from accidentes.CatalogosUtilView import listAccRestriccionesLicencia
from accidentes.CatalogosUtilView import listCatAgentesNew
from accidentes.CatalogosUtilView import listTbUnidades2008
from accidentes.CatalogosUtilView import listTbUnidades2008
from accidentes.CatalogosUtilView import listOperativos
from accidentes.CatalogosUtilView import listArticulos

from accidentes.CatalogosUtilView import listTipoEventos 
from accidentes.CatalogosUtilView import listCorporaciones 
from accidentes.CatalogosUtilView import listCompetentes 
from accidentes.CatalogosUtilView import listMps 
from accidentes.CatalogosUtilView import listVisibilidades 
from accidentes.CatalogosUtilView import listParteDias 
from accidentes.CatalogosUtilView import listTipoCalles 
from accidentes.CatalogosUtilView import listNoCarriles 
from accidentes.CatalogosUtilView import listSentidos 
from accidentes.CatalogosUtilView import listAlineaciones 
from accidentes.CatalogosUtilView import listEstadoCalles 
from accidentes.CatalogosUtilView import listClimas 
from accidentes.CatalogosUtilView import listRegulaciones 
from accidentes.CatalogosUtilView import listObjetosDanados 
from accidentes.CatalogosUtilView import listCirculaciones 
from accidentes.CatalogosUtilView import listLugares
from accidentes.CatalogosUtilView import listDescVehiculos
from accidentes.CatalogosUtilView import listCapVehs
from accidentes.CatalogosUtilView import listEnCustodias
from accidentes.CatalogosUtilView import listAutCompInv

from accidentes.PantallasUtilView import pantalla_cancelar_preliminar
from django.views.decorators.csrf import csrf_exempt, csrf_protect

# SECCION PARA LAS URL DE CATALOGOS





from perfil.views import modificar_perfil
from perfil.views import perfil_captura
from perfil.views import perfil_update
from perfil.views import perfil_create
from perfil.PerfilListView import  PerfilListView



# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

def my_view(request):
    # View code here...
    return render(request, 'accidentes/hola.jade', {"foo": "bar"})

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'systra.views.home', name='home'),
    # url(r'^systra/', include('systra.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    url(r'^$', main, name='main'),
    url(r'^login/$', signin, name='login'),
    url(r'^validatelogin/$', validate_login, name='validate-login'),
    url(r'^main/$', main, name='main'),
    url(r'^getProfile/$', getProfile, name='main'),
    url(r'^accidente/inicia$',inicia_accidente,name='iniciar_accidente'),
    url(r'^accidente/captura/([^/]+)/$',captura_accidente,name='captura_accidente'),
    url(r'^accidente/captura_para_seleccionar_preliminar/$',captura_accidente_para_seleccionar_preliminar,name='captura_accidente'),
    url(r'^accidente/cargarAccidente/([^/]+)/$',cargarAccidente_accidente,name='cargarAccidente_accidente'),
    url(r'^accidente/viewAccidente/([^/]+)/$',viewAccidente,name='viewAccidente'), 
    url(r'^accidente/crear$',create_accidente,name='create_accidente'),
    url(r'^accidente/listaPreliminaresp',AccCabinaListView.as_view(),name='LISTA PRELIMINAR JSON'),
    url(r'^accidente/list',AccidenteListView.as_view(),name='listar_accidente'),
    url(r'^accidente/listAccidentes.json$',listAccidentes_accidente,name='listAccidentes_accidente'),
    url(r'^accidente/getAccidente/([^/]+)/$',getAccidente_accidente,name='getAccidente_accidente'),
    
   

    url(r'^accidente/addPreliminar$',addPreliminar_accidente,name='addPreliminar_accidente'),
    url(r'^accidente/soloListaPreliminares',AccCabinaSoloListView.as_view(),name='LISTA PRELIMINAR JSON'),
    url(r'^accidente/soloCapturaPreliminar/([^/]+)/$',soloCapturarPreliminar,name='solo captura preliminar'),
    
    url(r'^accidente/listaPreliminares',listar_preliminar_accidente,name='listar_preliminar_accidente'),
    url(r'^accidente/getPreliminar/([^/]+)/$',getPreliminar_accidente,name='getPreliminar_accidente'),
    url(r'^accidente/cancelarPreliminar/$',cancelar_preliminar,name='getPreliminar_accidente'),

    url(r'^accidente/cargarPreliminar/([^/]+)/$',cargarPreliminar_accidente,name='cargarPreliminar_accidente'),
    url(r'^accidente/crearPreliminar/$',crearPreliminar_accidente,name='crearPreliminar_accidente'),
    url(r'^accidente/listarActivos/$',listar_Activos,name='listar_Activos'),
    url(r'^accidente/mapa_busqueda$',mapa_busqueda_accidente,name='mapa_busqeda_accidente'),
    url(r'^accidente/listPuntosAccidentes$',listPuntosAccidentes,name='listPuntosAaccidente'),    
    url(r'^accidente/getUrlImagenesDeAccidente/([^/]+)/$',getUrlImagenesDeAccidente,name='getUrlImagenesDeAccidente'),  
    url(r'^accidente/folios_totales/$',listar_folios_accidente,name='getUrlImagenesDeAccidente'),
    url(r'^accidente/reporte/$',reporte_accidente,name='getUrlImagenesDeAccidente'),    
    url(r'^accidente/ventana_reporte/$',ventana_reporte,name='getUrlImagenesDeAccidente'), 
    url(r'^accidente/ventana_reporte_from_id/([^/]+)/$',ventana_reporte_from_id,name='getUrlImagenesDeAccidente'), 
    url(r'^accidente/ventana_reporte_posterior/$',ventana_reporte_posterior,name='getUrlImagenesDeAccidente'), 
    url(r'^accidente/ventana_reporte_posterior_from_id/([^/]+)/$',ventana_reporte_posterior_from_id,name='getUrlImagenesDeAccidente'), 
    url(r'^accidente/pantallas/cancelar_preliminar/$',pantalla_cancelar_preliminar,name='getUrlImagenesDeAccidente'), 
    
    url(r'^infraccion/captura$',captura_infraccion,name='captura_infraccion'),
    url(r'^infraccion/crear$',crearInfraccion_infraccion,name='create_infraccion'),
    url(r'^infraccion/update$',updateInfraccion_infraccion,name='create_infraccion'),
    url(r'^infraccion/excel',ExcelInfraccionListView.as_view(),name='listar_accidente'),
    url(r'^infraccion/pdf_list',PdfInfraccionListView.as_view(),name='listar_accidente'),
    url(r'^infraccion/viewInfraccion/([^/]+)/$',viewInfraccion,name='list_infraccion'),
    url(r'^infraccion/list',InfraccionListView.as_view(),name='list_infraccion'),
    #url(r'^infraccion/listInfracciones.json$',listInfracciones_infraccion ,name='listInfracciones_infraccion'),
    url(r'^infraccion/getInfraccion/([^/]+)/$',get_infraccion ,name='get_infraccion'),
    url(r'^infraccion/cargarInfraccion/([^/]+)/$', cargarInfraccion_infraccion,name="cargarInfraccion_infraccion"),
    url(r'^infraccion/ventana_reporte_infraccion/$', ventana_reporte_infraccion,name="cargarInfraccion_infraccion"),
    url(r'^infraccion/ventana_reporte_infraccion_from_id/([^/]+)/$', ventana_reporte_infraccion_from_id,name="cargarInfraccion_infraccion"),
    url(r'^infraccion/solo_captura_infraccion/([^/]+)/$', solo_captura_infraccion,name="cargarInfraccion_infraccion"),
    url(r'^infraccion/removeInfraccion/([^/]+)/$', removeInfraccion,name="removeInfraccion"),
    url(r'^infraccion/getHistInfractor/([^/]+)/$', getHistInfractor,name="removeInfraccion"),
    url(r'^infraccion/getHistVehiculo/([^/]+)/$', getHistVehiculo,name="removeInfraccion"),
    
    url(r'^folios/list/$', list_folios,name="cargarInfraccion_infraccion"),
    url(r'^folios/add$', add_folio,name="agregar-folio"),
    url(r'^folios/getBlocksByFolio/([^/]+)/$', get_blocks_by_folio,name="get-blocksby-folio"),
    url(r'^folios/remove/([^/]+)/$', remove_folio,name="remove-folio"),
    url(r'^folios/folios_disponibles/$', folios_disponibles,name="folios-disponibles"),
    url(r'^folios/folios_capturados/$', folios_capturados,name="folios-capturados"),
    url(r'^folios/view_elem_folios/$', view_elem_folios,name="Folios por elementos"),
    url(r'^folios/json_elem_folios/$', json_elem_folios,name="Folios por elementos"),
    url(r'^folios/profile_historial_folios/([^/]+)/$', profile_historial_folios,name="Folios por elementos"),
    url(r'^folios/get_detail_from_folio/([^/]+)/$', get_detail_from_folio,name="Folios por elementos"),
    url(r'^folios/borrar_block/([^/]+)/$', remove_block,name="Folios por elementos"),
    url(r'^folios/list_comandancia/([^/]+)/$', list_comandancia,name="Folios por elementos"),



    url(r'^inventario/captura$',captura_inventario,name='captura_inventario'),
    url(r'^inventario/crear$',crear_inventario,name='crear_inventario'),
    url(r'^inventario/update$',update_inventario,name='crear_inventario'),
    url(r'^inventario/removeInventario/([^/]+)/$',remove_inventario,name='crear_inventario'),
    url(r'^inventario/liberar/([^/]+)/$',liberar_inventario,name='liberar_inventario'),
    url(r'^inventario/liberar_seleccionando/$',liberar_seleccionando,name='liberar_inventario'),
    url(r'^inventario/crear_liberar$',crear_liberar,name='crear_liberar'),
    url(r'^inventario/getInventario/([^/]+)/$',get_inventario, name='get_inventario'),
    url(r'^inventario/get_inventario_con_otros/([^/]+)/$',get_inventario_con_otros, name='get_inventario'),
    url(r'^inventario/listInventarios.json$',listInventarios_inventario ,name='listInventarios_inventario'),
    url(r'^inventario/list', InventarioVehiculoListView.as_view(),name='list_inventario'),
    url(r'^inventario/excel',ExcelInventarioVehiculoListView.as_view(),name='listar_accidente'),
    url(r'^inventario/cargarInventario/([^/]+)/$',cargarInventario_inventario,name='cargarInventario_inventario'),
    url(r'^inventario/ventana_reporte/$',libera_reporte,name='getUrlImagenesDeAccidente'),
    url(r'^inventario/viewInventario/([^/]+)/$',viewInventario,name='getUrlImagenesDeAccidente'),
    url(r'^inventario/ventana_reporte_from_id/([^/]+)/$',libera_reporte_from_id,name='getUrlImagenesDeAccidente'),  
    url(r'^inventario/solo_captura_inventario/([^/]+)/$',solo_captura_inventario,name='getUrlImagenesDeAccidente'), 
    #FOLIOS DE INVENTARIO

    url(r'^inventario/admin_folio$',inventarios_admin_folio,name='getUrlImagenesDeAccidente'), 
    url(r'^inventario/foliosaniobypension/([^/]+)/([^/]+)/$',inventarios_foliosaniobypension,name='getUrlImagenesDeAccidente'), 
    
    url(r'^content/content/([^/]+)/$',content_content,name='cargarInventario_inventario'),
    url(r'^content/upload_fotografia$',upload_fotografia,name='upload_fotografia'),
    url(r'^content/upload_croquis$',upload_croquis,name='upload_croquis'),

    url(r'^catalogos/delegaciones.json$', listDelegaciones, name='list_delegaciones'),
    url(r'^catalogos/comandancias.json$', listComandancias, name='list_comandancias'),
    url(r'^catalogos/turnos.json$', listTurnos, name='list_turnos'),
    url(r'^catalogos/clasAccidente.json$', listClasAccidente, name='list_clas_accidente'),
    url(r'^catalogos/tipoAccidente.json$', listAccTipoAccidente, name='list_tipo_accidente'),
    url(r'^catalogos/calles.json$', listCalles, name='list_calles'),
    url(r'^catalogos/colonias.json$', listColonias, name='list_colonias'),
    url(r'^catalogos/estados.json$', listEstados, name='list_estados'),
    url(r'^catalogos/municipios.json$', listMunicipios, name='list_municipios'),
    url(r'^catalogos/marcas.json$', listMarcas, name='list_marcas'),
    url(r'^catalogos/tipoVehiculo.json$', listTipoVehiculo, name='vehiculo_tipo'),
    url(r'^catalogos/pensiones.json$', listPensiones, name='pensiones'),
    url(r'^catalogos/colores.json$', listColores, name='colores'),
    url(r'^catalogos/listProfile.json/$', listProfile, name='main'),
    url(r'^catalogos/accEdoConductor.json$', listAccEdoConductor, name='accEdoConductor'),
    url(r'^catalogos/AccEdoFisico.json$', listAccEdoFisico, name='accEdoFisico'),
    url(r'^catalogos/TbDetenido.json$', listTbDetenido, name='tbDetenido'),
    url(r'^catalogos/TbLevantadopor.json$', listTbLevantadopor, name='TbLevantadopor'),
    url(r'^catalogos/TbTrasladadoa.json$', listTbTrasladadoa, name='TbTrasladadoa'),
    url(r'^catalogos/TbTipoLicencia.json$', listTbTipoLicencia, name='TbTipoLicencia'),
    url(r'^catalogos/AccRestriccionesLicencia.json$', listAccRestriccionesLicencia, name='AccRestriccionesLicencia'),
    url(r'^catalogos/CatAgentesNew.json$', listCatAgentesNew, name='CatAgentesNew'),
    url(r'^catalogos/TbUnidades2008.json$', listTbUnidades2008, name='tbUnidades2008'),
    url(r'^catalogos/articulos.json$', listArticulos, name='articulos'),
    url(r'^catalogos/operativos.json$', listOperativos, name='opeartivos'),
    url(r'^catalogos/tipoEventos.json$',listTipoEventos ,name="listTipoEventos"),
    url(r'^catalogos/corporaciones.json$',listCorporaciones,name='listCorporaciones'),
    url(r'^catalogos/competentes.json$',listCompetentes,name='listCompetentes'),
    url(r'^catalogos/mps.json$',listMps,name='listMps'),
    url(r'^catalogos/visibilidades.json$',listVisibilidades,name='listVisibilidades'),
    url(r'^catalogos/partedias.json$',listParteDias,name='listParteDias'),
    url(r'^catalogos/tipocalles.json$',listTipoCalles,name='listTipoCalles'),
    url(r'^catalogos/nocarriles.json$',listNoCarriles,name='listNoCarriles'),
    url(r'^catalogos/sentidos.json$',listSentidos,name='listSentidos'),
    url(r'^catalogos/alineaciones.json$',listAlineaciones,name='listAlineaciones'),
    url(r'^catalogos/estadocalles.json$',listEstadoCalles,name='listEstadoCalles'),
    url(r'^catalogos/climas.json$',listClimas,name='listClimas'),
    url(r'^catalogos/regulaciones.json$',listRegulaciones,name='listRegulaciones'),
    url(r'^catalogos/objetosdanados.json$',listObjetosDanados,name='listObjetosDanados'),
    url(r'^catalogos/circulaciones.json$',listCirculaciones,name='listCirculacion'),
    url(r'^catalogos/lugares.json$',listLugares,name='listLugares'),
    url(r'^catalogos/descVehiculos.json$',listDescVehiculos,name='listLugares'),
    url(r'^catalogos/capVehs.json$',listCapVehs,name='listar capacidad vehiculo'),
    url(r'^catalogos/enCustodias.json$',listEnCustodias,name='Listar en custodia'),
    url(r'^catalogos/aut_comp_inv.json$',listAutCompInv,name='Listar en custodia'),
    #URLS PARA ESTADISTICAS

    #URL PARA EL MANTENIMIENTO DE CATALOGOS
   
    url(r'^perfil/modificar/([^/]+)/$',modificar_perfil,name='Listar en custodia'),
    url(r'^perfil/create/$',perfil_create,name='Crear perfil'),
    url(r'^perfil/capturar/$',perfil_captura,name='Capturar perfil'),
    url(r'^perfil/list$',PerfilListView.as_view(),name='List Perfil'),
    url(r'^perfil/update$',perfil_update,name='Perfil update'),

    )
urlpatterns += staticfiles_urlpatterns()
#include("estadisticas.urls")