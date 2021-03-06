require "minitest/autorun"
require "./day07"

class TestDay07 < Minitest::Test
  def setup
    @solution = Year2020::Day07.new
  end

  def test_parser
    input = <<~EOF
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    EOF

    rules = @solution.parse_rules(input.split(/\n/))

    assert_equal 9, rules.keys.size
  end

  def test_sample_part_1
    input = <<~EOF
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    EOF

    assert_equal 4, @solution.part1(input.split(/\n/), "shiny gold")
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 326, @solution.part1(input, "shiny gold")
  end

  def test_sample_part_2
    input = <<~EOF
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    EOF

    assert_equal 32, @solution.part2(input.split(/\n/), "shiny gold")

    input = <<~EOF
      shiny gold bags contain 2 dark red bags.
      dark red bags contain 2 dark orange bags.
      dark orange bags contain 2 dark yellow bags.
      dark yellow bags contain 2 dark green bags.
      dark green bags contain 2 dark blue bags.
      dark blue bags contain 2 dark violet bags.
      dark violet bags contain no other bags.
    EOF

    assert_equal 126, @solution.part2(input.split(/\n/), "shiny gold")
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 0, @solution.part2(input, "shiny gold")
  end
end
