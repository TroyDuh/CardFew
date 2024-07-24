extends HTTPRequest

signal outputSignal

# Called when the node enters the scene tree for the first time.
func _ready():
	loadImage("https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/HONDA_ASIMO.jpg/640px-HONDA_ASIMO.jpg", imageOutput)

func imageOutput(image):
	pass

func loadImage(url, returnFunction):
	outputSignal.connect(returnFunction)
	# Create an HTTP request node and connect its completion signal.
	#var http_request = HTTPRequest.new()
	#add_child(http_request)
	request_completed.connect(_image_request_completed)
	
	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var error = request(url)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

# Called when the HTTP request is completed.
func _image_request_completed(result, response_code, headers, body):
	print("ya")
	var image = Image.new()
	var error = image.load_png_from_buffer(body)
	if error != OK:	
		push_error("Couldn't load the image.")
	
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	
	outputSignal.emit(texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
