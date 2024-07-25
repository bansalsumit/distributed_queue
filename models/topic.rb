require 'thread'

class Topic
  def initialize(name)
    @name = name
    @queue = Queue.new
    @consumers = []
  end

  def publish(message)
    @queue << message
    puts "Published: #{message} to #{@name}"
  end

  def subscribe(consumer)
    @consumers << consumer
  end

  def notify_consumers
    Thread.new do
      while true
        message = @queue.pop
        @consumers.each do |consumer|
          Thread.new { consumer.consume(message) }
        end
      end
    end
  end
end