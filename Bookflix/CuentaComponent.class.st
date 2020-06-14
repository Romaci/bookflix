Class {
	#name : #CuentaComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'model',
		'nombre',
		'usuarioCuenta'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
CuentaComponent >> cancelar [
self answer 
]

{ #category : #'as yet unclassified' }
CuentaComponent >> eliminarTarjeta: unaTarjeta [
	
	self session getUser eliminarTarjeta: unaTarjeta.
	^self.
]

{ #category : #'as yet unclassified' }
CuentaComponent >> guardar [

	
   self session getUser nombre: nombre.


]

{ #category : #'as yet unclassified' }
CuentaComponent >> irEditarTarjeta: unaTarjeta [

	self call: ((EditarTarjetaUserComponent  new) tarjeta: unaTarjeta).

]

{ #category : #'as yet unclassified' }
CuentaComponent >> irRegistrarTarjeta [

self call: RegistrarTarjetaUserComponent  new .
]

{ #category : #'as yet unclassified' }
CuentaComponent >> modificarApellido [

self call: EditarApellidoUserComponent new.
]

{ #category : #'as yet unclassified' }
CuentaComponent >> modificarEmail [

self call: EditarEmailUserComponent new.
]

{ #category : #'as yet unclassified' }
CuentaComponent >> modificarNombre [

self call: EditarNombreUserComponent new.

"modificarNombre:aCanvas

aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre'.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: 'Escriba su nuevo nombre'.].
				
				aCanvas button
			callback: [self guardar ];
			with: 'Guardar'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].
			"
]

{ #category : #rendering }
CuentaComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas break.
	self renderDatosPersonalesOn: aCanvas.
	aCanvas heading
				class:'centro';
				style: 'margin-bottom:1.5px';
				with: 'Tarjetas'.
			aCanvas anchor
				callback: [ self irRegistrarTarjeta ];
				class:'centro';
				with: [ aCanvas text: 'Agregar Tarjeta' ].
	(self session getUser tarjetas) do:[:each| self renderTarjeta: each On: aCanvas].

]

{ #category : #rendering }
CuentaComponent >> renderDatosPersonalesOn: aCanvas [
aCanvas div
class:'centro';
with:[
aCanvas heading:'Datos personales'.
aCanvas div 
	class:'caja';
	with:[	
			aCanvas div
	class:'gridForm';
	with:
	[ aCanvas div
		with:[aCanvas text: 'NOMBRE'.].
		aCanvas div
		with:[aCanvas text: self session getUser nombre.].
		aCanvas div
		with:[aCanvas anchor
		callback: [ self modificarNombre   ];
		with: [ aCanvas text: 'Modificar' ].].
		].
	aCanvas div
	class:'gridForm';
	with:
	[ aCanvas div
		with:[aCanvas text: 'APELLIDO'.].
		aCanvas div
		with:[aCanvas text: self session getUser apellido.].
		aCanvas div
		with:[aCanvas anchor
		callback: [ self modificarApellido   ];
		with: [ aCanvas text: 'Modificar' ].].
	].
	aCanvas div
	class:'gridForm';
	with:
	[ aCanvas div
		with:[aCanvas text: 'NOMBRE DE USUARIO '.].
		aCanvas div
		with:[aCanvas text: self session getUser user].
		aCanvas div
		with:[aCanvas text: ''].
		].
	aCanvas div
	class:'gridForm';
	style: 'border-bottom-width: 0px;';
	with:
	[ aCanvas div
		with:[aCanvas text: 'EMAIL '.].
		aCanvas div
		with:[aCanvas text: self session getUser mail.].
		aCanvas div
		with:[aCanvas anchor
		callback: [ self modificarEmail   ];
		with: [ aCanvas text: 'Modificar' ]].
	].].].

	

	

]

{ #category : #rendering }
CuentaComponent >> renderTarjeta: unaTarjeta On: aCanvas [
	aCanvas div
		class: 'centro';
		with: [ 
			aCanvas div
				class: 'caja';
				with: [ aCanvas div
						class: 'gridForm2';
						with: [ aCanvas div with: [ aCanvas text: 'NRO' ].
							aCanvas div with: [ aCanvas text: unaTarjeta nro ].
							aCanvas div ].
					aCanvas div
						class: 'gridForm2';
						with: [ aCanvas div with: [ aCanvas text: 'NOMBRE DE TITULAR' ].
							aCanvas div with: [ aCanvas text: unaTarjeta nombre, ' ' , unaTarjeta apellido].
							aCanvas div ].
					aCanvas div
						class: 'gridForm2';
						with: [ aCanvas div with: [ aCanvas text: 'VENCIMIENTO' ].
							aCanvas div with: [aCanvas text: unaTarjeta expDate].
							aCanvas div ].
					aCanvas div
						class: 'gridForm2';
						style: 'border-bottom-width: 0px;';
						with: [ aCanvas div.
							aCanvas div.
							aCanvas div
								with: [ aCanvas anchor
										callback: [ self irEditarTarjeta: unaTarjeta ];
										with: [ aCanvas text: 'Modificar' ].
									(self session getUser tarjetas size > 1)
									ifTrue: [
										aCanvas text: ' | '.
										aCanvas anchor
										callback: [ self eliminarTarjeta: unaTarjeta];
										with: [ aCanvas text: 'Eliminar' ] ] ] ] ]]
]

{ #category : #'as yet unclassified' }
CuentaComponent >> volver [ 
	self answer.
]

{ #category : #'as yet unclassified' }
CuentaComponent >> volver: aCanvas [
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button with: 'Volver' ]
]
