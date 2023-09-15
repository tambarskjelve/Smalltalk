Class {
	#name : #MBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'MicroBlog-Tests'
}

{ #category : #accessing }
MBBlogTest >> setUp [
blog := MBBlog current.
blog removeAllPosts.
first := MBPost title: 'A title' text: 'A text' category: 'First category'.
blog writeBlogPost: first.
post := (MBPost title: 'Another title' text: 'Another text' category: 'Second category') beVisible


]

{ #category : #accessing }
MBBlogTest >> tearDown [
MBBlog reset
]

{ #category : #accessing }
MBBlogTest >> tesetAllCategories [
blog writeBlogPost: post.
self assert: blog allCategories size equals: 2
]

{ #category : #accessing }
MBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
	
]

{ #category : #accessing }
MBBlogTest >> testAllBlogPosts [
blog writeBlogPost: post.
self assert: blog allBlogPosts size equals: 2
]

{ #category : #accessing }
MBBlogTest >> testAllBlogPostsFromCategory [
	self assert: (blog allBlogPostsFromCategory: 'First category') size equals: 1
]

{ #category : #accessing }
MBBlogTest >> testAllCategories [
blog writeBlogPost: post.
self assert: blog allCategories size equals: 2
]

{ #category : #accessing }
MBBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals:1
]

{ #category : #accessing }
MBBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisibleBlogPostsFromCategory: 'First category') size equals: 0.
	self assert: (blog allVisibleBlogPostsFromCategory: 'Second category') size equals: 1.
	
]

{ #category : #accessing }
MBBlogTest >> testRemoveAllBlogPosts [
blog removeAllPosts.
self assert: blog size equals: 0
]

{ #category : #accessing }
MBBlogTest >> testSize [
self assert: blog size equals: 1
]

{ #category : #accessing }
MBBlogTest >> testUnclassifiedBlogPosts [
	self assert: (blog allBlogPosts select: [ :p | p isUnclassified]) size equals: 0
]
