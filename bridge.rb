# A Abstração (Abstraction) define a interface para a parte de controle das duas classes
# hierarquicas. Ele mantém uma referência para um objeto da Implementação
# hierarquica e delega todo o trabalho real para este objeto.
class Abstraction
  # @param [Implementation] implementation
  def initialize(implementation)
    @implementation = implementation
  end

  # @return [String]
  def operation
    "Abstraction: Base operation with:\n"\
    "#{@implementation.operation_implementation}"
  end
end

# Você pode estender a abstração sem alterar as classes de implementação.
class ExtendedAbstraction < Abstraction
  # @return [String]
  def operation
    "ExtendedAbstraction: Extended operation with:\n"\
    "#{@implementation.operation_implementation}"
  end
end

# A implementação define a interface para todas as classes de implementação. 
# Ele não precisa corresponder a interface de abstração. De fato, as duas interfaces
# pode ser totalmente diferentes. Normalmente a implementação de interface fornece 
# somente operações primitivas, enquanto a Abstração (Abstraction) ddefine operações 
# de alto nível basaeda nestas primitivas.
class Implementation
  # @abstract
  #
  # @return [String]
  def operation_implementation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Cada Concrete Implementation corresponde a uma plataforma específica e implementa
# a interface de implementação usando a API dessa plataforma.
class ConcreteImplementationA < Implementation
  # @return [String]
  def operation_implementation
    'ConcreteImplementationA: Here\'s the result on the platform A.'
  end
end

class ConcreteImplementationB < Implementation
  # @return [String]
  def operation_implementation
    'ConcreteImplementationB: Here\'s the result on the platform B.'
  end
end

# Exceto para a fase de inicialização, onde um objeto abstrato (Abstraction) é vinculado
# com uma específica implementação de obejtos, o código do cliente deve depender apenas
# da classe Abstraction. Dessa forma, o código do cliente pode suportar qualquer abstração -
# combinação de implementação.
def client_code(abstraction)
  # ...

  print abstraction.operation

  # ...
end

# O código do cliente deve ser capaz de trabalhar com alguma abstração pré-configurada -
# combinação de implementação.

implementation = ConcreteImplementationA.new
abstraction = Abstraction.new(implementation)
client_code(abstraction)

puts "\n\n"

implementation = ConcreteImplementationB.new
abstraction = ExtendedAbstraction.new(implementation)
client_code(abstraction)