defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

s1 = %Subscriber{}

s2 = %Subscriber{ name: "Dave" }

s3 = %Subscriber{ name: "Mary", paid: true }

IO.puts s3.name

%Subscriber{name: a_name} = s3

IO.puts a_name

s4 = %Subcriber{ s3 | name: "Marie" }
