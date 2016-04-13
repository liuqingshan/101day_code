module SuperForwardable

  def self.extended(clazz)
    require "forwardable"
    clazz.extend(Forwardable)
  end

  def def_delegators_with_super(target, *methods)
    methods.each do |method|
      target_method = "#{method}_without_super".to_sym

      def_delegator(target, method, target_method)
      #调用target_method, 则执行method方法，注意def_delegator方法的定义

      define_method(method) do |*args, &block|
        send(target_method, *args, &block)
        super(*args, &block)
      end
    end
  end
end
