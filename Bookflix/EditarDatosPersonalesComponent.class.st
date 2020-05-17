Class {
	#name : #EditarDatosPersonalesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'apellido',
		'email'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
EditarDatosPersonalesComponent >> apellido:unApe [

apellido:=unApe.
]

{ #category : #'as yet unclassified' }
EditarDatosPersonalesComponent >> cancelar [
self answer 
]

{ #category : #accessing }
EditarDatosPersonalesComponent >> email:unEmail [

email:=unEmail .
]

{ #category : #'as yet unclassified' }
EditarDatosPersonalesComponent >> guardar [

	nombre ifNotNil: [self session getUser nombre: nombre.].

	apellido ifNotNil: [self session getUser apellido: apellido.].
	email ifNotNil: [self session getUser mail: email.].

	self answer
]

{ #category : #accessing }
EditarDatosPersonalesComponent >> nombre:unNombre [

nombre:=unNombre . 
]

{ #category : #rendering }
EditarDatosPersonalesComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre'.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: ''.].
			
	
			aCanvas paragraph: [ aCanvas label: 'Apellido '.
					aCanvas textInput 
					callback: [ :valor| self apellido:valor];
					with: ''.].
				
		  aCanvas paragraph: [ aCanvas label: 'Email'.
					aCanvas textInput  
					callback: [ :valor| self email:valor];
					with: ''.].

		aCanvas button
			callback: [self guardar ];
			with: 'Guardar'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].





]

{ #category : #hooks }
EditarDatosPersonalesComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	#respuesta { text-align: center; }
	a {color:red} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
EditarDatosPersonalesComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
