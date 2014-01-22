define [ '../core/sandbox'
], (sandbox) ->
	 
	app=
		pdf:null
		y:0
		iniciar:->
		in:(x,y, texto)->
			this.pdf.setFontType("bold")
			this.pdf.text(x,y,texto)
			this.pdf.setFontType("normal")
			return
		ib:(x,y,texto)->
			this.pdf.setFontType("normal")
			this.pdf.text(x,y,texto)
			this.pdf.setFontType("normal")
			return
		obtenerDataUrl:(img)->
			canvas = document.createElement("canvas")
			ctx= canvas.getContext("2d")
			canvas.width=img.width
			canvas.height=img.height
			ctx.drawImage(img,0,0,img.width, img.height)
			try 
				dataURL = canvas.toDataURL("image/jpeg")
			catch e
				console.log e
			return dataURL
		generar:(accidente)->
			that=this
			accidente= window.accidente
			cl=()->
				if that.y>250
					that.y=20
					that.pdf.addPage()

			this.sandbox=  new sandbox this
			this.pdf=new jsPDF()
			#src_croquis="/croquis/croquis.jpg"
			#src_croquis='/content/content/' + accidente.croquis + ".jpg"
			src_rosa="/static/croquis/rosa_viento.jpg"
			img_rosa= new Image()
			img_rosa.src= src_rosa
			image= document.getElementById("img_croquis")
			dataURL=this.obtenerDataUrl(image)
			rosaURL=this.obtenerDataUrl(img_rosa)
			this.pdf.setFontSize(10)
			this.ib(130,20,"PARTE DE ACCIDENTE Nº:")
			this.in(176,20,  accidente.folio_accidente)
			this.pdf.setFontSize(14)
			this.in(80,29,"CROQUIS")
			this.pdf.setFontSize(8)
			this.pdf.addImage(dataURL,'JPEG', 30,30,150,100)
			this.pdf.addImage(rosaURL,'JPEG', 180,30,20,20)
			this.pdf.setFontSize(14)
			this.in(9,138,"SIMBOLOGIA")
			this.pdf.setFontSize(8)
			this.y=138
			this.y=this.y+10
			this.pdf.setFontSize(10)
			lines=this.pdf.splitTextToSize(accidente.simbologia_croquis,185)
			this.pdf.text(9,this.y,lines)
			tam= lines.length
			this.y= this.y+ tam*4
			this.pdf.setFontSize(14)
			this.in(9,this.y,"INVESTIGACIONES Y CAUSAS DEL ACCIDENTE")
			this.pdf.setFontSize(8)
			this.y = this.y+ 5

			this.pdf.setFontSize(10)
			lines=this.pdf.splitTextToSize(accidente.investigaciones,185)
			this.pdf.text(9,this.y,lines)
			tam= lines.length
			this.y= this.y+tam*4

			this.pdf.line(9,this.y,89,this.y)
			this.pdf.line(109,this.y,190,this.y)
			this.y= this.y+5
			x=20
			this.in(x,this.y,accidente.intervino.gafete)
			this.in(x+8,this.y,accidente.intervino.nombre)

			x=120

			this.in(x,this.y,accidente.superviso.gafete)
			this.in(x+8,this.y,accidente.superviso.nombre)
			this.y= this.y+5
			x= 30
			this.in(x,this.y,"INTERVINO")
			x=  140
			this.in(x,this.y,"SUPERVISO")

			
			



			 

			#this.pdf.addImage(rosaURL,'JPEG', 30,200,10,10)
			return this.pdf.output('datauristring')
