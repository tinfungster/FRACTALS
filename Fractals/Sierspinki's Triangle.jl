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

# ╔═╡ c8e11800-1874-11eb-2e58-53acb96689fb
# Add several packages to our environment

begin
	using Compose
	using PlutoUI
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

# ╔═╡ 2884fbe0-187b-11eb-0be4-4d03f526a50c
md"Complexity = $(@bind number Slider(0:7, show_value=true))"

# ╔═╡ 98768e90-187c-11eb-19e5-17c8b90fe324
md"## Sierpinski's triangle is defined _recursively_:
- Sierpinski's triangle of complexity N is a figure in the form of a triangle which is made of 3 triangular figures which are themselves Sierpinski's triangles of complexity N-1. In other words, the Sierspinki Triangle is made up of three copies of itself which are around an upside down equilateral triangle with the same size.
 

- A Sierpinski's triangle of complexity 0 is a simple solid equilateral triangle."

# ╔═╡ 7838c9a0-21ef-11eb-1672-b3aca3f79b32
md"# How can I draw it?"

# ╔═╡ fe972230-21ef-11eb-2c2f-35e42e64de5f
step = 1

# ╔═╡ 468628d2-1880-11eb-27d7-71598afaf445
md"# See you in the next video."

# ╔═╡ 52c3bf82-21f0-11eb-1895-fd0e7807793a
md"# Bye!!! 👋"

# ╔═╡ 595093e0-21f1-11eb-2581-0db61d8c2262
md"# How did I program the Sierspinki Triangle with Julia?"

# ╔═╡ b3f0d570-1874-11eb-002c-fd0abf2c1d9d
md"To draw Sierpinski's triangle, we are going to use two external packages, [_Compose.jl_](https://giovineitalia.github.io/Compose.jl/latest/tutorial) and [_PlutoUI.jl_](https://github.com/fonsp/PlutoUI.jl). Let's import the packages into our notebook. (You can download them in the terminal or Atom REPL.)
A package contains a coherent set of functionality that you cannot do with Julia."

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

# ╔═╡ 15a8be20-21f0-11eb-2938-0f4033a36423
sierpinski(step - 1)

# ╔═╡ Cell order:
# ╟─a18e4c30-1880-11eb-0d80-e34d6fb8f5fe
# ╟─a9d1b190-187e-11eb-02c5-2909b144bc33
# ╟─73d06d30-187d-11eb-1b07-c16f07d51e2f
# ╟─a95adf70-1874-11eb-20f6-11f9b697522b
# ╟─2884fbe0-187b-11eb-0be4-4d03f526a50c
# ╟─d0bf15c0-187b-11eb-3a7a-c50bb793cdd8
# ╠═b9bc0ab0-1879-11eb-3b22-c558830517c3
# ╟─98768e90-187c-11eb-19e5-17c8b90fe324
# ╟─7838c9a0-21ef-11eb-1672-b3aca3f79b32
# ╠═fe972230-21ef-11eb-2c2f-35e42e64de5f
# ╟─15a8be20-21f0-11eb-2938-0f4033a36423
# ╟─468628d2-1880-11eb-27d7-71598afaf445
# ╟─52c3bf82-21f0-11eb-1895-fd0e7807793a
# ╟─595093e0-21f1-11eb-2581-0db61d8c2262
# ╟─b3f0d570-1874-11eb-002c-fd0abf2c1d9d
# ╠═c8e11800-1874-11eb-2e58-53acb96689fb
# ╠═673a7362-187b-11eb-00ec-4983d864eb34
# ╠═aa6b60e0-187b-11eb-1d9f-3dfbe0bdf48c
# ╠═c4eaac50-187b-11eb-3c92-29f462b7e2d4
