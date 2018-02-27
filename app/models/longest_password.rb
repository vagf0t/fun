
#You would like to set a password for a bank account. However, there are 2 restrictions on the format of the password:
#it has to contain only non numerical characters (a−z, A−Z); there should be at least a capital letter. Given a string of
#alphanumerical characters return the length of the longest possible password

s.split(/[0-9]/).grep(/[A-Z]/).max_by(&:length).size

