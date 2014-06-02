Puppet::Type.newtype(:mysql_user) do
  @doc = "Manage mysql users"

  ensurable

  newparam(:name, :namevar => true) do
    desc "The user name"

    validate do |value|
      unless value =~ /[a-z0-9_]+/
        raise ArgumentError , "%s is not a valid user name" % value
      end
    end
  end

  newparam(:host) do
    desc "The host name"

    validate do |value|
      unless value =~ /[a-z0-9\.*-]+/
        raise ArgumentError , "%s is not a valid host name" % value
      end
    end
  end

end
