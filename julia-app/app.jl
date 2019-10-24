using Distributed
using Distributions

nb_draws = 100000

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

pi_approx = pi_serial(nb_draws);


println("Approximation for Pi $(pi_approx) with $(nb_draws) random draws")
println("True value is $(pi)")


