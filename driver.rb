require_relative './services/queue_system.rb'
require_relative './models/consumer.rb'
require_relative './models/producer.rb'

class Driver
  def self.run
    queue_system = QueueSystem.new

    queue_system.create_topic('topic1')
    queue_system.create_topic('topic2')

    producer1 = Producer.new('producer1')
    producer2 = Producer.new('producer2')

    consumer1 = Consumer.new('consumer1')
    consumer2 = Consumer.new('consumer2')
    consumer3 = Consumer.new('consumer3')
    consumer4 = Consumer.new('consumer4')
    consumer5 = Consumer.new('consumer5')

    topic1 = queue_system.get_topic('topic1')
    topic2 = queue_system.get_topic('topic2')

    [consumer1, consumer2, consumer3, consumer4, consumer5].each { |consumer| topic1.subscribe(consumer) }
    [consumer1, consumer3, consumer4].each { |consumer| topic2.subscribe(consumer) }

    producer1.publish(topic1, 'Message 1')
    producer1.publish(topic1, 'Message 2')
    producer2.publish(topic1, 'Message 3')
    producer1.publish(topic2, 'Message 4')
    producer2.publish(topic2, 'Message 5')

    sleep(10)
  end
end

# Run the driver
Driver.run