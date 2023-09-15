Class {
	#name : #MBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'visible',
		'category'
	],
	#category : #MicroBlog
}

{ #category : #initalize }
MBPost class >> title: aTitle text: aText [
	^ self new 
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #initalize }
MBPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
		category: aCategory;
		yourself
]

{ #category : #accessing }
MBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #'action\t' }
MBPost >> beVisible [
	self visible: true
]

{ #category : #accessing }
MBPost >> category [
	^ category
]

{ #category : #accessing }
MBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
MBPost >> date [
	^ date
]

{ #category : #accessing }
MBPost >> date: aDate [
	date := aDate
]

{ #category : #initalize }
MBPost >> initialize [
	super initialize.
	self category: MBPost unclassifiedTag;
		 date: Date today;
		 notVisible
]

{ #category : #testing }
MBPost >> isUnclassified [
	^ self category = MBPost unclassifiedTag
]

{ #category : #'testing\t' }
MBPost >> isVisible [
	^ self visible
]

{ #category : #'action\t' }
MBPost >> notVisible [
	self visible: false
]

{ #category : #accessing }
MBPost >> text [
	^ text
]

{ #category : #accessing }
MBPost >> text: aString [
	text := aString
]

{ #category : #accessing }
MBPost >> title [
	^ title
]

{ #category : #accessing }
MBPost >> title: aString [
	title := aString
]

{ #category : #accessing }
MBPost >> visible [
	^ visible
]

{ #category : #accessing }
MBPost >> visible: aBoolean [
	visible:= aBoolean
]
