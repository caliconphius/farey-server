using Oxygen
using Farey

@get "/" function()
    "hello world!"
end
@get "/echo" function(req)
    return queryparams(req)
end

@get "/farey" function ()
    "$(ContinuedFraction(30//1323))"
end

const PORT = parse(Int, get(ENV, "PORT", "8080"))

# F2 = FreeGroup((;:f=>:F, :g=>:G))
# f, g = GPC.gens(F2)
# F, G = GPC.gens(F2) .|> inv

# F2ab = FreeGroup((;:a=>:A, :a=>:B))
# a, b = GPC.gens(F2ab)
# A, B = GPC.gens(F2ab) .|> inv


println("Starting Julia server on port $(PORT) …")
serve(host="0.0.0.0",port=PORT)
