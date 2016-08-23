require 'test_helper'

class PhasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phase = phases(:one)
  end

  test "should get index" do
    get phases_url
    assert_response :success
  end

  test "should get new" do
    get new_phase_url
    assert_response :success
  end

  test "should create phase" do
    assert_difference('Phase.count') do
      post phases_url, params: { phase: { background: @phase.background, bottlenecks: @phase.bottlenecks, criteria: @phase.criteria, end_date: @phase.end_date, interval: @phase.interval, key_benefits: @phase.key_benefits, kpi_s: @phase.kpi_s, long_term: @phase.long_term, long_term_vision: @phase.long_term_vision, note: @phase.note, problem_definition: @phase.problem_definition, proof_of_value: @phase.proof_of_value, sequence: @phase.sequence, solutions: @phase.solutions, start_date: @phase.start_date, test_first: @phase.test_first, vision: @phase.vision } }
    end

    assert_redirected_to phase_url(Phase.last)
  end

  test "should show phase" do
    get phase_url(@phase)
    assert_response :success
  end

  test "should get edit" do
    get edit_phase_url(@phase)
    assert_response :success
  end

  test "should update phase" do
    patch phase_url(@phase), params: { phase: { background: @phase.background, bottlenecks: @phase.bottlenecks, criteria: @phase.criteria, end_date: @phase.end_date, interval: @phase.interval, key_benefits: @phase.key_benefits, kpi_s: @phase.kpi_s, long_term: @phase.long_term, long_term_vision: @phase.long_term_vision, note: @phase.note, problem_definition: @phase.problem_definition, proof_of_value: @phase.proof_of_value, sequence: @phase.sequence, solutions: @phase.solutions, start_date: @phase.start_date, test_first: @phase.test_first, vision: @phase.vision } }
    assert_redirected_to phase_url(@phase)
  end

  test "should destroy phase" do
    assert_difference('Phase.count', -1) do
      delete phase_url(@phase)
    end

    assert_redirected_to phases_url
  end
end
