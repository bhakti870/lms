@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Leaderboard'])

<section class="dashboard-area pt-60px pb-120px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="dashboard-heading mb-5">
                    <h3 class="fs-22 font-weight-semi-bold">Top Learners</h3>
                    <p>See where you stand against other students based on quiz performance.</p>
                </div>
                
                <div class="table-responsive">
                    <table class="table generic-table">
                        <thead>
                            <tr>
                                <th scope="col">Rank</th>
                                <th scope="col">Student</th>
                                <th scope="col">Total Quiz Score</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($leaders as $index => $leader)
                            <tr>
                                <td>
                                    @if($index == 0) <span class="badge badge-warning fs-14">🥇 1st</span>
                                    @elseif($index == 1) <span class="badge badge-secondary fs-14">🥈 2nd</span>
                                    @elseif($index == 2) <span class="badge badge-danger fs-14">🥉 3rd</span>
                                    @else #{{ $index + 1 }}
                                    @endif
                                </td>
                                <td>
                                    <div class="media media-card align-items-center">
                                        <div class="media-body ml-3">
                                            <h5 class="fs-15 font-weight-semi-bold">{{ $leader->name }}</h5>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="text-success font-weight-bold">{{ $leader->quiz_results_sum_score ?? 0 }} Points</span></td>
                            </tr>
                            @endforeach
                            
                            @if($leaders->isEmpty())
                                <tr>
                                    <td colspan="3" class="text-center">No quiz data available yet.</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</section>
@endsection
