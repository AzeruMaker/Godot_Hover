extends Node2D

class Hover:
	var text_edit = TextEdit.new()
	
	func _init(node):
		node.add_child(text_edit)	
		text_edit.selecting_enabled = false
		text_edit.editable = false
		text_edit.caret_move_on_right_click = false
		text_edit.context_menu_enabled = false
		text_edit.visible = false
		text_edit.mouse_default_cursor_shape = Control.CURSOR_ARROW

	func set_text (text) :
		text_edit.text = text
	
	func set_visible (text_visible) :
		text_edit.visible = text_visible
		
	func set_dimension (sizeX, sizeY):
		text_edit.size.x = sizeX
		text_edit.size.y = sizeY
	
	func set_pos (pos):
		text_edit.position.x = pos.x + 10
		text_edit.position.y = pos.y + 10

@onready var test = Hover.new(self) 
var is_in_image = false

# Called when the node enters the scene tree for the first time.
func _ready():
	test.set_dimension (100, 100)
	test.set_text("Hello there")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_in_image == true):
		test.set_pos(get_global_mouse_position())

func _on_area_2d_mouse_shape_entered(shape_idx):
	is_in_image = true
	test.set_visible(true)

func _on_area_2d_mouse_shape_exited(shape_idx):
	test.set_visible(false)
	is_in_image = false
