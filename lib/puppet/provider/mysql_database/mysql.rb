Puppet::Type.type(:mysql_database).provide(:mysql) do
  desc "Manage databases, none of this will work without a .my.cnf file"

  commands :mysql => 'mysql', :mysqladmin => 'mysqladmin'

  def show_databases(str = '.*')
    begin
      output = mysql(['-B', '-N', '-e', 'show databases'])
    rescue Puppet::ExecutionFailure => e
      Puppet.debug("#mysql request had an error -> #{e.inspect}")
      return nil
    end
    databases = output.split("\n").sort
    databases.grep(/^#{str1}$/).count
  end

  def create

  end

  def destroy

  end

  def exists?
    
    mysql('-e', 'show databases')
  end

end
