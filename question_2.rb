class Foo
  def self.method_missing(name)
    puts name
  end
end

Foo.hello_world
Foo.hi
