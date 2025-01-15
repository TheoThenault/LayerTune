extends Node

@export_category("Layer1")
@export var enable1 : bool = false
@export_enum("Drum", "Piano", "Flute", "Banjo", "Harmonica", "Whistle") var instrument1 : String
@export_range(1, 36) var note1 : int
@export_range(50, 200, 5) var bpm1 : int

@export_category("Layer2")
@export var enable2 : bool = false
@export var instrument2 : String
@export var note2 : int
@export_range(50, 200, 5) var bpm2 : int

@export_category("Layer3")
@export var enable3 : bool = false
@export var instrument3 : String
@export var note3 : int
@export_range(50, 200, 5) var bpm3 : int

@export_category("Layer4")
@export var enable4 : bool = false
@export var instrument4 : String
@export var note4 : int
@export_range(50, 200, 5) var bpm4 : int

@export_category("Layer5")
@export var enable5 : bool = false
@export var instrument5 : String
@export var note5 : int
@export_range(50, 200, 5) var bpm5 : int

@export_category("Layer6")
@export var enable6 : bool = false
@export var instrument6 : String
@export var note6 : int
@export_range(50, 200, 5) var bpm6 : int
