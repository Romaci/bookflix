Class {
	#name : #EditarApellidoUserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'apellido',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
EditarApellidoUserComponent >> apellido:unApe [

apellido:=unApe.
]

{ #category : #'as yet unclassified' }
EditarApellidoUserComponent >> cancelar [
self answer 
]

{ #category : #'as yet unclassified' }
EditarApellidoUserComponent >> guardar [

	self session getUser apellido:apellido.

	self answer
]

{ #category : #initialization }
EditarApellidoUserComponent >> initialize [
	super initialize. 
]

{ #category : #accessing }
EditarApellidoUserComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
EditarApellidoUserComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas 
	form: [aCanvas paragraph: [ aCanvas label: 'Apellido '.
					aCanvas textInput 
					callback: [ :valor| self apellido:valor];
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
EditarApellidoUserComponent >> style [
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
EditarApellidoUserComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
