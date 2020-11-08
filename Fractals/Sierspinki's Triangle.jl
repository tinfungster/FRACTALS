### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ a18e4c30-1880-11eb-0d80-e34d6fb8f5fe
md"# Math for FUN!!!"

# ╔═╡ a9d1b190-187e-11eb-02c5-2909b144bc33
md"# FRACTALS!!!  😊"

# ╔═╡ 73d06d30-187d-11eb-1b07-c16f07d51e2f
md"# What is a Fractal? 🤔
### A fractal is a shape where you can zoom in infinitely on a shape and it will still look similar to itself. "

# ╔═╡ a95adf70-1874-11eb-20f6-11f9b697522b
md"# _The Sierpinksi's triangle_"

# ╔═╡ fd73f4c0-1874-11eb-0a39-0d29d0dae707
number = 6

# ╔═╡ 468628d2-1880-11eb-27d7-71598afaf445
md"# See you in the next video. Bye!!! 👋
# Bye!!! 👋"

# ╔═╡ d17cbb40-188d-11eb-2bb0-efb6bb4b9300


# ╔═╡ b3f0d570-1874-11eb-002c-fd0abf2c1d9d
md"To draw Sierpinski's triangle, we are going to use an external package, [_Compose.jl_](https://giovineitalia.github.io/Compose.jl/latest/tutorial). Let's set up a package environment and add the package.
A package contains a coherent set of functionality that you can often use a black box according to its specification. There are [lots of Julia packages](https://juliahub.com/ui/Home).
"

# ╔═╡ c8e11800-1874-11eb-2e58-53acb96689fb
# Add several packages to our environment
begin
	using Compose
	using PlutoUI
end

# ╔═╡ 98768e90-187c-11eb-19e5-17c8b90fe324
md"## Sierpinski's triangle is defined _recursively_:
- Sierpinski's triangle of complexity N is a figure in the form of a triangle which is made of 3 triangular figures which are themselves Sierpinski's triangles of complexity N-1.
- A Sierpinski's triangle of complexity 0 is a simple solid equilateral triangle"

# ╔═╡ d9026d60-1874-11eb-3354-dd67f07554a9
md"Just like the definition above, our `sierpinksi` function is _recursive_: it calls itself."

# ╔═╡ 7a18f120-1874-11eb-2686-a520e4ce9a7e
if number == 3 
	md"""
Try changing the value of **`complexity` to `5`** in the cell above. 
Hit `Shift + Enter` to affect the change.
	"""
else
	md"""
**Great!** As you can see, all the cells in this notebook are linked together by the variables they define and use. Just like a spreadsheet!
	"""
end


# ╔═╡ 4de91610-187a-11eb-33cc-9f80081b04a1
md"### Exercise 2.1
As you can see, the total area covered by triangles is lower when the complexity is higher."

# ╔═╡ 5f9921c0-187a-11eb-2c08-f7d5f53a7a52
md"""
Can you write a function that computes the _area of `sierpinski(n)`_, as a fraction of the area of `sierpinski(0)`?
So:
```
area_sierpinski(0) = 1.0
area_sierpinski(1) = 0.??
...
```
"""

# ╔═╡ 682760e2-187a-11eb-3872-3723fc7df624
function area_sierpinski(n)
	return 3 / 4
end

# ╔═╡ 7b2f8280-187a-11eb-106d-8d297088aa3e
if area_sierpinski(0) == 1.0 && area_sierpinski(1) == 3 / 4
	md"""
!!! correct
    Well done!
	"""
else
	md"""
!!! warning "Incorrect"
    Keep working on it!
	"""
end

# ╔═╡ 9608d4d0-187a-11eb-1061-91ff6f37b103
md"**Let's try it out below:**"

# ╔═╡ 2884fbe0-187b-11eb-0be4-4d03f526a50c
md"Complexity = $(@bind n Slider(0:6, show_value=true))"

# ╔═╡ 450372b0-187b-11eb-1bb5-5b636b710f28
md"""
!!! hint
    Can you write `area_sierpinksi(n)` as a function of `area_sierpinski(n-1)`?
"""

# ╔═╡ 673a7362-187b-11eb-00ec-4983d864eb34
triangle() = compose(context(), polygon([(1, 1), (0, 1), (1 / 2, 0)]))

# ╔═╡ aa6b60e0-187b-11eb-1d9f-3dfbe0bdf48c
# It does not matter which order you define the building blocks (functions) of the
# program in. The best way to organize code is the one that promotes understanding.

function place_in_3_corners(t)
	# Uses the Compose library to place 3 copies of t
	# in the 3 corners of a triangle.
	# treat this function as a black box,
	# or learn how it works from the Compose documentation here https://giovineitalia.github.io/Compose.jl/latest/tutorial/#Compose-is-declarative-1
	compose(context(),
			(context(1 / 4,   0, 1 / 2, 1 / 2), t),
			(context(0, 1 / 2, 1 / 2, 1 / 2), t),
			(context(1 / 2, 1 / 2, 1 / 2, 1 / 2), t))
end

# ╔═╡ c4eaac50-187b-11eb-3c92-29f462b7e2d4
function sierpinski(n)
	if n == 0
		triangle()
	else
		t = sierpinski(n - 1) # recursively construct a smaller sierpinski's triangle
		place_in_3_corners(t) # place it in the 3 corners of a triangle
	end
end

# ╔═╡ d0bf15c0-187b-11eb-3a7a-c50bb793cdd8
sierpinski(number)

# ╔═╡ b9bc0ab0-1879-11eb-3b22-c558830517c3
sierpinski.(0:6)

# ╔═╡ dc601320-187b-11eb-2a81-cfc60d52bc39
md"""
Sierpinski's triangle of complexity $(n)
 $(sierpinski(n))
has area **$(area_sierpinski(n))**
"""

# ╔═╡ Cell order:
# ╟─a18e4c30-1880-11eb-0d80-e34d6fb8f5fe
# ╟─a9d1b190-187e-11eb-02c5-2909b144bc33
# ╟─73d06d30-187d-11eb-1b07-c16f07d51e2f
# ╟─a95adf70-1874-11eb-20f6-11f9b697522b
# ╠═fd73f4c0-1874-11eb-0a39-0d29d0dae707
# ╟─d0bf15c0-187b-11eb-3a7a-c50bb793cdd8
# ╠═b9bc0ab0-1879-11eb-3b22-c558830517c3
# ╠═468628d2-1880-11eb-27d7-71598afaf445
# ╠═d17cbb40-188d-11eb-2bb0-efb6bb4b9300
# ╟─b3f0d570-1874-11eb-002c-fd0abf2c1d9d
# ╠═c8e11800-1874-11eb-2e58-53acb96689fb
# ╟─98768e90-187c-11eb-19e5-17c8b90fe324
# ╟─d9026d60-1874-11eb-3354-dd67f07554a9
# ╠═7a18f120-1874-11eb-2686-a520e4ce9a7e
# ╠═4de91610-187a-11eb-33cc-9f80081b04a1
# ╠═5f9921c0-187a-11eb-2c08-f7d5f53a7a52
# ╠═682760e2-187a-11eb-3872-3723fc7df624
# ╠═7b2f8280-187a-11eb-106d-8d297088aa3e
# ╠═9608d4d0-187a-11eb-1061-91ff6f37b103
# ╠═2884fbe0-187b-11eb-0be4-4d03f526a50c
# ╟─450372b0-187b-11eb-1bb5-5b636b710f28
# ╠═673a7362-187b-11eb-00ec-4983d864eb34
# ╠═aa6b60e0-187b-11eb-1d9f-3dfbe0bdf48c
# ╠═c4eaac50-187b-11eb-3c92-29f462b7e2d4
# ╠═dc601320-187b-11eb-2a81-cfc60d52bc39
