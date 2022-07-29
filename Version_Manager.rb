class VersionManager
  attr_accessor :major, :minor, :patch

  def initialize(version = '0.0.1')
    version_array = version.split('.').map{|s| s = Integer(s)}
    @major = version_array[0]
    if version_array.size > 1
      @minor = version_array[1]
    else
      @minor = 0
    end
    if version_array.size > 2
      @patch = version_array[2]
    else
      @patch = 0
    end
    @version_history = []
  end

  def major!
    @major += 1
    @minor = 0
    @patch = 0
    @version_history.unshift([@major, @minor, @patch])
  end

  def minor!
    @minor += 1
    @patch = 0
    @version_history.unshift([@major, @minor, @patch])
  end

  def patch!
    @patch += 1
    @version_history.unshift([@major, @minor, @patch])
  end

  def rollback!
    if @version_history == []
      raise 'Can not rollback to previous version'
    else
      @version_history = @version_history.drop(1)
      @major, @minor, @patch = @version_history.first
    end
  end

  def release
    "#{@major}.#{@minor}.#{@patch}"
  end

end

vm = VersionManager.new('1.0')
p vm.release

vm.major! # увеличивает мажорную версию, устанавливая минорную и патч в 0 (напр. “2.0.0”)
vm.minor! # увеличивает минорную версию, устанавливая патч в 0 (напр. “2.1.0”)
vm.patch! # увеличивает патч версию (напр. “2.1.1”)
p vm.release

vm.rollback! # возвращается к прошлой версии, если это возможно, иначе выдать ошибку
p vm.release