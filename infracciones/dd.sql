DROP TABLE IF EXISTS infracciones_infractor;
create table  infracciones_infractor(   
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre  varchar(250) NULL,
    appPat varchar(250)  NULL,
    appMat  varchar(50) NULL,
    sexo  varchar(50) NULL,
    edad  varchar(50) NULL,
    domicilio varchar(250)  NULL,
    numero  varchar(50) NULL,
    colonia varchar(50) NULL,
    ciudad  varchar(50) NULL,
    estado  varchar(50) NULL,
    no_licencia varchar(250)  NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS infracciones_vehiculo;
create table  infracciones_vehiculo(
    id int(11) NOT NULL AUTO_INCREMENT,
    clas_vehiculo  varchar(50) NULL,
    marca  varchar(50) NULL,
    submarca  varchar(50) NULL,
    modelo  varchar(50) NULL,
    color  varchar(50) NULL,
    detalle_color  varchar(50) NULL,
    tipo_placa  varchar(50) NULL,
    placas  varchar(50) NULL,
    estado_placa  varchar(50) NULL,
    serie  varchar(50) NULL,
    tipo varchar(50) NULL,
    empresa  varchar(50) NULL,
    ruta  varchar(50) NULL,
    no_economico  varchar(50) NULL,
    no_tarjeton  varchar(50) NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS infracciones_infraccion;
CREATE TABLE infracciones_infraccion (
  id int(11) NOT NULL AUTO_INCREMENT,
  folio decimal(10,0) DEFAULT NULL,
  servicio varchar(50) DEFAULT NULL,
  hora_infrac time DEFAULT NULL,
  fecha_infrac date DEFAULT NULL,
  delegacion varchar(50) DEFAULT NULL,
  comandancia varchar(50) DEFAULT NULL,
  turno varchar(50) DEFAULT NULL,
  num_cobro_agente int(11) DEFAULT NULL,
  infractor_presente varchar(1) DEFAULT NULL,
  articulos varchar(50) DEFAULT NULL,
  calle1 varchar(255) DEFAULT NULL,
  calle2 varchar(255) DEFAULT NULL,
  frente_num varchar(50) DEFAULT NULL,
  Colonia2 varchar(50) DEFAULT NULL,
  se_recogio varchar(255) DEFAULT NULL,
  certificado_medico varchar(20) DEFAULT NULL,
  conductor_estado varchar(50) DEFAULT NULL,
  firma_conductor varchar(255) DEFAULT NULL,
  fecha_captura datetime DEFAULT NULL,
  fecha_final_captura datetime DEFAULT NULL,
  usuario varchar(50) DEFAULT NULL,
  status int(11) DEFAULT NULL,
  longitud varchar(50) DEFAULT NULL,
  latitud varchar(50) DEFAULT NULL,
  tipo_operativo varchar(255) DEFAULT NULL,
  activo int(11) DEFAULT NULL,
  nombre_colonia_infraccion varchar(50) DEFAULT NULL,
  nombre_calle1 varchar(50) DEFAULT NULL,
  nombre_calle2 varchar(50) DEFAULT NULL,
  propietario_nombre varchar(50) DEFAULT NULL,
  propietario_domicilio varchar(100) DEFAULT NULL,
  propietario_colonia varchar(50) DEFAULT NULL,
  observaciones_infraccion mediumtext,
  tipo_placa varchar(255) DEFAULT NULL,
  estado_placa varchar(50) DEFAULT NULL,
  vigencia_licencia datetime DEFAULT NULL,
  servicio_publico varchar(50) DEFAULT NULL,
  nombreAgente varchar(100) DEFAULT NULL,
  circulacion varchar(50) DEFAULT NULL,
  recoje_licencia_estado varchar(50) DEFAULT NULL,
  recoje_licencia_no_conducir varchar(50) DEFAULT NULL,
  recoje_licencia_tipo varchar(50) DEFAULT NULL,
  recoje_licencia_restricciones varchar(50) DEFAULT NULL,
  recoje_vehiculo_no_inventario varchar(50) DEFAULT NULL,
  recoje_vehiculo_pension varchar(50) DEFAULT NULL,
  recoje_licencia_fecha_vencimiento varchar(50) DEFAULT NULL,
  infractor_id int(11) NOT NULL,
  vehiculo_id int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS infracciones_detalle;
CREATE TABLE infracciones_detalle (
  id int(11) NOT NULL AUTO_INCREMENT,
  folio decimal(10,0) DEFAULT NULL,
  id_articulo int(11) DEFAULT NULL,
  articulo varchar(150) DEFAULT NULL,
  parrafo varchar(150) DEFAULT NULL,
  concepto mediumtext,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS infracciones_infraccion_detalles;
CREATE TABLE infracciones_infraccion_detalles (
  id int(11) NOT NULL AUTO_INCREMENT,
  infraccion_id int(11) DEFAULT NULL,
  detalle_id int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;