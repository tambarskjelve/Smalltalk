Class {
	#name : #MBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #MicroBlog
}

{ #category : #accessing }
MBBlog class >> createDemoPosts [
"TBBlog createDemoPosts"
         self current
            writeBlogPost: ((MBPost title: 'Welcome in TinyBlog' text: 'TinyBlog is a small blog engine made with Pharo.' category:'TinyBlog') visible: true);
            writeBlogPost: ((MBPost title: 'Report Pharo Sprint' text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done' category: 'Pharo') visible: true);
            writeBlogPost: ((MBPost title: 'Brick on top of Bloc - Preview' text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.' category: 'Pharo') visible: true);
            writeBlogPost: ((MBPost title: 'The sad story of unclassified blog posts' text: 'So sad that I can read this.') visible: true);
            writeBlogPost: ((MBPost title: 'Working with Pharo on the Raspberry Pi' text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #accessing }
MBBlog class >> current [
	"answer the instance of the MBRepository"
	^ uniqueInstance ifNil: [uniqueInstance := self new]
]

{ #category : #accessing }
MBBlog class >> initialize [
	self reset
]

{ #category : #accessing }
MBBlog class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
MBBlog >> allBlogPosts [
	^ posts
]

{ #category : #accessing }
MBBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #accessing }
MBBlog >> allCategories [
	^(self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #accessing }
MBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #accessing }
MBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ]]
]

{ #category : #initalize }
MBBlog >> initialize [
	super initialize.
	posts := OrderedCollection new.
]

{ #category : #accessing }
MBBlog >> removeAllPosts [
	posts := OrderedCollection new
]

{ #category : #accessing }
MBBlog >> size [
	^ posts size
]

{ #category : #accessing }
MBBlog >> writeBlogPost: aPost [
	"Add the blog post to the list of posts."
	posts add: aPost
]
