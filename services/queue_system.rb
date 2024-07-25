require_relative '../models/topic.rb'

class QueueSystem
  def initialize
    @topics = {}
  end

  def create_topic(name)
    topic = Topic.new(name)
    @topics[name] = topic
    topic.notify_consumers
  end

  def get_topic(name)
    @topics[name]
  end
end