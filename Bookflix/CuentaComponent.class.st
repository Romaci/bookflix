Class {
	#name : #CuentaComponent,
	#superclass : #WAComponent,
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
CuentaComponent >> guardar:unNombre [

	
   self session getUser nombre: unNombre.

	self answer



]

{ #category : #'as yet unclassified' }
CuentaComponent >> logOut [
	self show: (LoginComponent new )
]

{ #category : #'as yet unclassified' }
CuentaComponent >> logOutButton: aCanvas [
aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				id: 'cuooter';
				with: [ aCanvas text: 'Usuario en sesión: '.
					aCanvas anchor
						callback: [ self verDatosPersonales: self session getUser ];
						with: [ aCanvas text: self session getUser user  ] ].
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self logOut ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ]
]

{ #category : #'as yet unclassified' }
CuentaComponent >> modificarNombre [

self call: EditarDatosPersonalesComponent new.

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
		aCanvas break.
	aCanvas text: 'Nombre de usuario: '.
	aCanvas text: self session getUser user  .
		aCanvas break.
	aCanvas text: 'Nombre: '.
	aCanvas text: self session getUser nombre.
	aCanvas horizontalRule.
	

]

{ #category : #hooks }
CuentaComponent >> style [
	^ '
	body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	.cuerpo { padding: 15px 25px 25px 25px; display: flex; flex: 30px; flex-direction: row; justify-content: center; background-color: white }
	#pieDeRespuesta{text-align: center; color: ForestGreen}
	#CuOOra { text-align: left; color: ForestGreen; font-family: arial; font-size: 60px;  } 
	#respuesta { text-align: center; }
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: DarkOrange; }
	a {color: green; color: MediumSeaGreen; text-decoration: none}
	#cuooter { color: ForestGreen }
	#contLogout { display: flex; flex-flow: row; align-items: center; align-content: center ; justify-content: flex-end; }
	#acepCan { display: flex; flex-flow: row; justify-content: space-between; }
	form { border-radius: 8px;  } 
	button { background-color: ForestGreen; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: 	inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: 	pointer;}
	button:hover {background-color: ForestGreen; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);}
	textArea { height: 6em; width: 400px;}
	input { width: 400px;}
	'
]

{ #category : #'as yet unclassified' }
CuentaComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'CuOOra';
		with: [ aCanvas text: 'Bookflix' ].
	aCanvas div
		id: 'logout';
		with: [ self logOutButton: aCanvas ].
	aCanvas div
		id: 'volverButton';
		with: [ aCanvas div with: [ self volver: aCanvas].
		aCanvas break.
			aCanvas horizontalRule .
]
]

{ #category : #'as yet unclassified' }
CuentaComponent >> volver: aCanvas [
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button with: 'Volver' ]
]
