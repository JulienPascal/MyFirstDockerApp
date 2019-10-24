using Distributed
using Distributions
using Genie, Genie.Router, Genie.Renderer, Genie.Requests
import Genie.Router: @params


form = """
<h1>Approximation of Pi</h1>
	<p> Enter an integer in the form, I will calculate an approximation of Pi.
	</p>
<form action="/" method="POST" enctype="multipart/form-data">
  <input type="text" name="nb_draws" value="" placeholder="Enter number of random draws" />
  <input type="submit" value="Enter" />
</form>
"""

route("/") do
  html(form)
end

route("/", method = POST) do

	function inside_circle(x::Float64, y::Float64)
	    output = 0
	    if x^2 + y^2 <= 1
		output = 1
	    end
	    return output
	end

	function pi_serial(nbPoints::Int64 = 128 * 1000; d=Uniform(-1.0,1.0))

	   #draw NbPoints from within the square centered in 0
	   #with side length equal to 2
	   xDraws = rand(d, nbPoints)
	   yDraws = rand(d, nbPoints)
	   sumInCircle = 0

	   for (xValue, yValue) in zip(xDraws, yDraws)
		sumInCircle+=inside_circle(xValue, yValue)
	   end

	   return 4*sumInCircle/nbPoints

	end


	pi_approx = pi_serial(parse(Int64, @params(:nb_draws)));


	"""
  	<h1>Approximation of Pi</h1>
	
Approximation for Pi $(pi_approx) with $(parse(Int64, @params(:nb_draws))) random draws <br> True value is $(pi)"""

end

up()


