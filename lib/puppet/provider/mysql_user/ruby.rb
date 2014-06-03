Puppet::Type.type(:mysql_user).provide(:ruby) do
  commands :mysqladmin => 'mysqladmin'

  def get_mysql_users(int)
    begin
      output = mysqladmin(['-getproxybypassdomains', int])
    rescue Puppet::ExecutionFailure => e
      Puppet.debug("#get_mysql_users had an error -> #{e.inspect}")
      return nil
    end
    users = output.split("\n").sort
    return nil if users.first =~ /There aren\'t any bypass domains set/
    users
  end

end
