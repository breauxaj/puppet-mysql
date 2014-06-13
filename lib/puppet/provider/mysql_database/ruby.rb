Puppet::Type.type(:mysql_database).provide(:ruby) do
  desc "Manage databases, none of this will work without a .my.cnf file"

  commands :mysql => 'mysql', :mysqladmin => 'mysqladmin'

  def create

  end

  def destroy

  end

  def exists?
    mysql 'show databases'
  end

end
