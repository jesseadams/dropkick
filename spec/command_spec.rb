require './spec/spec_helper.rb'

describe Command do
  it 'must securely execute a command without arguments' do
    result = Command.secure_exec('ls')
    result.wont_be_nil
    result.stderr.must_equal ""
    result.stdout.wont_equal ""
    result.successful?.must_equal true
  end

  it 'must securely execute a command with arguments' do
    result = Command.secure_exec('ls', ['-al', '/'])
    result.wont_be_nil
    result.stderr.must_equal ""
    result.stdout.wont_equal ""
    result.successful?.must_equal true
  end

  it 'must allow exceptions to bubble up higher' do
    proc { Command.secure_exec('foobarbaz') }.must_raise Errno::ENOENT 
  end
  
  it 'must handle commands that have runtime errors' do
    result = Command.secure_exec('ls', ['-al', '/foo/bar/baz'])
    result.wont_be_nil
    result.stderr.wont_equal ""
    result.stdout.must_equal ""
    result.successful?.must_equal false
  end
end
