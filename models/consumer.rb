require 'thread'

class Consumer
  def initialize(id)
    @id = id
  end

  def consume(message)
    sleep(rand(0.1..1.0)) # Simulate processing time
    puts "#{@id} recieved #{message} on thread #{Thread.current.object_id}"
  end
end