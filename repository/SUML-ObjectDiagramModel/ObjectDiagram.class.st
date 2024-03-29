Class {
	#name : #ObjectDiagram,
	#superclass : #Diagram,
	#category : #'SUML-ObjectDiagramModel'
}

{ #category : #'as yet unclassified' }
ObjectDiagram >> connectNodes [
	self diagramNodes do:[:node | node connectToReferencesWithin: self]
]

{ #category : #'as yet unclassified' }
ObjectDiagram >> connectNodes: references [
	"self diagramNodes do:[:node | node connectToReferencesWithin: self]"
	references do:[ :aReference | (self diagramNodeFor:  aReference from) connectTo: (self diagramNodeFor:  aReference to) using: (ReferenceRelationship new label: aReference name )].
]

{ #category : #drawing }
ObjectDiagram >> objectNodesMorphs [
	^self objectNodes collect:[:objectNode | ObjectNodeMorph for: objectNode ]
]

{ #category : #'as yet unclassified' }
ObjectDiagram >> objects [
	^self diagramNodes collect:[:diagramNode | diagramNode object]
]

{ #category : #drawing }
ObjectDiagram >> openView [
	^self objectNodesMorphs do:[:objectNodeMorph | objectNodeMorph openInWorld ]
]

{ #category : #'as yet unclassified' }
ObjectDiagram >> resetConnections [
	self diagramNodes do:[:node | node resetConnections]
]

{ #category : #'as yet unclassified' }
ObjectDiagram >> updateDiagramNodesFrom: aDictionaryOfNamedObjects [
	
	(aDictionaryOfNamedObjects keys copyWithoutAll: self objects) do:[:anObject |
		| objectName |
		"This is really ugly. I should get a better strategy for naming objects. But yet i have no clue what is this naming for :)  "
		objectName := '_' join: (aDictionaryOfNamedObjects at: anObject).
		 self addDiagramNode: (ObjectNode for: anObject named:  objectName   ).
	].
	
	(self objects copyWithoutAll: aDictionaryOfNamedObjects keys ) do:[:anObject | self removeDiagramNode: (self diagramNodeFor: anObject)].
	
]
