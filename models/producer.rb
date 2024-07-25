require 'thread'

class Producer
  def initialize(id)
    @id = id
  end

  def publish(topic, message)
    topic.publish(message)
    puts "#{@id} published #{message} on thread #{Thread.current.object_id}"
  end
end