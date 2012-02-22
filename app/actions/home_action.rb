# encoding: utf-8
class HomeAction < Cramp::Action
  self.transport = :sse
  use_fiber_pool :size => 1000

  periodic_timer :latest_events, :every => 5

  on_start :send_params

  def send_params
    render "params"
  end

  def latest_events
    render "latest events"
  end
end

