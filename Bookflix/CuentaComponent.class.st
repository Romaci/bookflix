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
CuentaComponent >> guardar [

	
   self session getUser nombre: nombre.


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
	self renderDatosPersonalesOn: aCanvas
]

{ #category : #rendering }
CuentaComponent >> renderDatosPersonalesOn: aCanvas [

	aCanvas text: 'Titular de la cuenta'.
		aCanvas break.
		aCanvas break.
	aCanvas text: 'Nombre: '.
	aCanvas text: self session getUser nombre.
	aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarNombre   ];
		with: [ aCanvas button with: 'Modificar nombre' ].
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas text: 'Apellido: '.
	aCanvas text: self session getUser apellido  .
	aCanvas anchor
		callback: [ self modificarApellido   ];
		with: [ aCanvas button with: 'Modificar apellido' ].
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas text: 'Nombre de usuario: '.
	aCanvas text: self session getUser user  .
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas text: 'Email: '.
	aCanvas text: self session getUser mail.
	aCanvas anchor
		callback: [ self modificarEmail   ];
		with: [ aCanvas button with: 'Modificar email' ].
	aCanvas horizontalRule.


]

{ #category : #'as yet unclassified' }
CuentaComponent >> volver: aCanvas [
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button with: 'Volver' ]
]
