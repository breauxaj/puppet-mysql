Puppet::Type.newtype(:mysql_database) do
  desc "Manage mysql databases"

  ensurable

  newparam(:name, :namevar => true) do
    desc "The database name"

    validate do |value|
      unless value =~ /[a-zA-Z0-9$_]+/
        raise ArgumentError , "%s is not a valid database name" % value
      end
    end

  end

  newparam(:character) do
    desc "The character set"

    validate do |value|
      unless value =~ /[a-z0-9]+/
        raise ArgumentError , "%s is not a valid character set" % value
      end
    end

  end

  newparam(:collate) do
    desc "The collation"

    validate do |value|
      unless value =~ /[a-z0-9_]+/
        raise ArgumentError , "%s is not a valid collation" % value
      end
    end

  end

end
