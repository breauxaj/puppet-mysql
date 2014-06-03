Puppet::Type.newtype(:mysql_user) do
  desc "Manage mysql users"

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
      unless value =~ /[a-z0-9\.*\-%]+/
        raise ArgumentError , "%s is not a valid host/ip" % value
      end
    end

  end

  newparam(:password) do
    desc "The password, at least 5 characters, no more that 16 characters"

    validate do |value|
      unless value =~ /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,16}$/
        raise ArgumentError , "%s is not a secure password" % value
      end
    end

  end

end
