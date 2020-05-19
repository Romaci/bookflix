Class {
	#name : #ErrorLoginAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'password'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ErrorLoginAdminComponent >> irLoginAdmin [

self call: LoginAdminWithMoldComponent new. 
]

{ #category : #rendering }
ErrorLoginAdminComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas horizontalRule 
		with: [aCanvas div
		with: [ aCanvas 
				paragraph: 'El usuario y/o constraseña ingresados son incorrectos'.
	   
		aCanvas anchor
			callback: [self irLoginAdmin ];
			with: 'Volver a iniciar sesión'.].
		].  
]

{ #category : #hooks }
ErrorLoginAdminComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkblue; font-family: arial; font-size: 60px;} 
	#respuesta { text-align: center; }
	a {color:darkblue} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkblue; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
ErrorLoginAdminComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
