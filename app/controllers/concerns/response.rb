module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def response_with_message(status, message)
    { status: status, message: message }
  end

  def response_with_id(status, message, id)
    { status: status, message: message, id: id }
  end

  def successful_response(message, status = :ok)
    render json: response_with_message('Success', message), status: status
  end

  def successful_post(id, message = "Record Created Successfully.", status = 'Success')
    render json: response_with_id(status, message, id), status: :created
  end

  def unprocessable_entity(message = "There is a problem with the request body you sent.")
    render json: response_with_message('Error', message), status: :unprocessable_entity
  end
end
