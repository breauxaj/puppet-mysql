Puppet::Type.type(:mysql_user).provide(:ruby) do
  commands :mysqladmin => 'mysqladmin'



end
