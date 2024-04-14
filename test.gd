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
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_in_image == true):
		test.set_pos(get_global_mouse_position())

#---------------------------------------------------------------------------
# Face 1
#---------------------------------------------------------------------------

func _face1_input_event(viewport, event, shape_idx):
	if (event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT):
		print("Link 1, your click is in another castle")
			# Move right.

func _face1_mouse_shape_entered(shape_idx):
	is_in_image = true
	test.set_dimension (150, 150)
	test.set_text("Random face 1 : 
	⚔+1
	🛡+1
	🛠️+2
	🌱+3")
	test.set_visible(true)

func _face1_mouse_shape_exited(shape_idx):
	test.set_visible(false)
	is_in_image = false
	
#---------------------------------------------------------------------------
# Face 2
#---------------------------------------------------------------------------

func _on_face_2_mouse_shape_entered(shape_idx):
	is_in_image = true
	test.set_dimension (200, 150)
	test.set_text("Another random face 3 : 
	⚔+3
	🛡+4
	🛠️+5
	🌱+6")
	test.set_visible(true)

func _on_face_2_mouse_shape_exited(shape_idx):
	test.set_visible(false)
	is_in_image = false

func _on_face_2_input_event(viewport, event, shape_idx):
	if (event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT):
		print("Link 2, your click is in another castle")
