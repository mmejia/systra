define [
		'core/sandbox'
],(sandbox)->
	modulo=
		padreId:"#managerCertificadoMedico_spa_inf"
		elementId:"#CertificadoMedicoServParticularInf-View"
		element:null
		template:null
		padre:null
		articulosSel:[]
		iniciar:->
			that=this
			this.padre= $ this.padreId
			this.sandbox= new sandbox this
			#this.template=template
			#this.padre.append this.template
			this.sandbox.on 'update-certificado-medico',this.updateCertificadoMedico
			this.sandbox.on 'limpiar-certificado-medico',this.limpiarCertificadoMedico
			this.sandbox.on 'llenar-infraccion-certificado-medico',this.llenarInfraccionCertificadoMedico
		updateCertificadoMedico:()->
			this.renderCertificadoMedico()
		limpiarCertificadoMedico:()->
			$('#certificado_medico_cm_sp_inf').val('')
			$('#ebriedad_incompleta_cm_spa_inf').attr("checked",false)
			$('#ebriedad_completa_cm_spa_inf').attr("checked",false)
			$('#bajo_influjo_drogas_cm_spa_inf').attr("checked",false)
			$('#aliento_alcoholico_cm_spa_inf').attr("checked",false)
			$('#estado_normal_cm_spa_inf').attr("checked",false)
		llenarInfraccionCertificadoMedico:->
			certificado= window.infraccion.certificado={}
			certificado.certificado_numero=$('#certificado_medico_cm_sp_inf').val()
			if $('#ebriedad_incompleta_cm_spa_inf').is(":checked")
				certificado.ebriedad_incompleta="si"
			else
				certificado.ebriedad_incompleta="no"
			if $('#ebriedad_completa_cm_spa_inf').is(":checked")
				certificado.ebriedad_completa="si"
			else
				certificado.ebriedad_completa="no"
			if $('#bajo_influjo_drogas_cm_spa_inf').is(":checked")
				certificado.influjo_droga="si"
			else
				certificado.influjo_droga="no"
			if $('#aliento_alcoholico_cm_spa_inf').is(":checked")
				certificado.aliento_alcoholico="si"
			else
				certificado.aliento_alcoholico="no"
			if $('#estado_normal_cm_spa_inf').is(":checked")
				certificado.normal="si"
			else
				certificado.normal="no"
			return


		renderCertificadoMedico:()->
			certificado= window.infraccion.certificado
			$('#certificado_medico_cm_sp_inf').val(certificado.certificado_numero)
			if certificado.ebriedad_incompleta == 'si'
				$('#ebriedad_incompleta_cm_spa_inf').click()
			if certificado.ebriedad_completa == 'si'
				$('#ebriedad_completa_cm_spa_inf').click()
			if certificado.influjo_droga == "si"
				$('#bajo_influjo_drogas_cm_spa_inf').click()
			if certificado.aliento_alcoholico == "si"
				$('#aliento_alcoholico_cm_spa_inf').click()
			if certificado.normal =='si'
				$('#estado_normal_cm_spa_inf').click()
			return

